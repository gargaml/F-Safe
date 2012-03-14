#include <stdlib.h>
#include <stdio.h>

typedef struct n_oe_u_d {
	unsigned int numero ;
	unsigned int degre_entrant ;
	unsigned int degre_sortant ;
	struct n_oe_u_d * * successeurs ;
	unsigned int disponible ;
	unsigned int utilisation ;
} n_oe_u_d ;

typedef struct m_a_i_l_l_o_n {
	n_oe_u_d * noeud ;
	struct m_a_i_l_l_o_n * suivant ;
} m_a_i_l_l_o_n ;

typedef struct {
	m_a_i_l_l_o_n * haut ;
} p_i_l_e ;

typedef struct {
	n_oe_u_d * borne ;
	unsigned int rang ;
	p_i_l_e * elements ;
} l_i_s_t_e ;

n_oe_u_d * racine ;
unsigned int nombre_listes = 0 ;
p_i_l_e * pile ;
l_i_s_t_e * * listes ;
unsigned int indentation = 0 ;

void aide(char * programme) {
	printf("Synstaxe : %s racine successeurs_1 successeurs_2...\n",programme) ;
}

void indente() {
	unsigned int i ;

	for ( i = 0 ; i < indentation ; i++ ) {
		printf("\t") ;
	}
}

void empile(p_i_l_e * pile, n_oe_u_d * noeud) {
	m_a_i_l_l_o_n * nouveau ;

	if ( NULL == ( nouveau = (m_a_i_l_l_o_n *) malloc(sizeof(m_a_i_l_l_o_n)) ) ) {
		fprintf(stderr,"Plus de mémoire disponible pour continuer.\n") ;
		exit(1) ;
	}
	nouveau->noeud = noeud ;
	nouveau->suivant = pile->haut ;
	pile->haut = nouveau ;
}

n_oe_u_d * depile(p_i_l_e * pile) {
	n_oe_u_d * noeud = pile->haut->noeud ;
	m_a_i_l_l_o_n * maillon = pile->haut ;
	pile->haut = maillon->suivant ;
	free(maillon) ;
	return noeud ;
}

void ajoute_noeud(l_i_s_t_e * liste, n_oe_u_d * noeud) {
	empile(liste->elements, noeud) ;
}

void ajoute_liste(n_oe_u_d * noeud) {
	nombre_listes++ ;
	indente() ;
	printf("j = %u\n",nombre_listes) ;
	if ( NULL == ( listes = realloc(listes, nombre_listes * sizeof(l_i_s_t_e *)) ) ) {
		fprintf(stderr,"Plus de mémoire pour ajouter une liste\n") ;
		exit(2) ;
	}
	if ( NULL == ( listes[nombre_listes - 1] = (l_i_s_t_e *) malloc(sizeof(l_i_s_t_e)) ) ) {
		fprintf(stderr,"Plus de mémoire pour créer une liste\n") ;
		exit(3) ;
	}
	if ( NULL == ( listes[nombre_listes - 1]->elements = (p_i_l_e *) malloc(sizeof(p_i_l_e)) ) ) {
		fprintf(stderr,"Plus de mémoire pour créer une liste\n") ;
		exit(4) ;
	}
	listes[nombre_listes - 1]->elements->haut = NULL ;
	listes[nombre_listes - 1]->borne = noeud ;
	indente() ;
	printf("borne.%u = %u\n",nombre_listes,noeud->numero) ;
	listes[nombre_listes - 1]->rang = noeud->utilisation ;
	indente() ;
	printf("rang.%u = %u\n",nombre_listes,listes[nombre_listes - 1]->rang) ;
}

affiche(const p_i_l_e * pile) {
	m_a_i_l_l_o_n * maillon ;

	printf("{ ") ;
	maillon = pile->haut ;
	while ( NULL != maillon ) {
		printf("%u ",maillon->noeud->numero) ;
		maillon = maillon->suivant ;
	}
	printf("}\n") ;
}

void parcours(n_oe_u_d * noeud) {
	unsigned int i ;
	unsigned int profondeur = nombre_listes + 1 ;

	indente() ;
	printf("parcours(%u)\n",noeud->numero) ;
	indentation++ ;
	indente() ;
	printf("k = %u\n",profondeur) ;
	if ( 0 != noeud->disponible ) {
		if ( 0 != noeud->utilisation ) {
			profondeur++ ;
			indente() ;
			printf("k = %u\n",profondeur) ;
			ajoute_liste(noeud) ;
		}
		empile(pile,noeud) ;
		indente() ;
		printf("pile = ") ;
		affiche(pile) ;
		noeud->disponible-- ;
		indente() ;
		printf("%u.d = %u\n",noeud->numero,noeud->disponible) ;
		noeud->utilisation++ ;
		indente() ;
		printf("%u.u = %u\n",noeud->numero,noeud->utilisation) ;
		indente() ;
		printf("pour chaque successeur de %u faire\n",noeud->numero) ;
		indentation++ ;
		for ( i = 0 ; i < noeud->degre_sortant ; i++ ) {
			parcours(noeud->successeurs[i]) ;
		}
		indentation-- ;
		indente() ;
		printf("fin pour\n") ;
		depile(pile) ;
		indente() ;
		printf("pile = ") ;
		affiche(pile) ;
		noeud->disponible++ ;
		indente() ;
		printf("%u.d = %u\n",noeud->numero,noeud->disponible) ;
		noeud->utilisation-- ;
		indente() ;
		printf("%u.u = %u\n",noeud->numero,noeud->utilisation) ;
		indente() ;
		printf("pour i allant de %u à %u faire\n",profondeur,nombre_listes) ;
		indentation++ ;
		for ( i = profondeur ; i <= nombre_listes ; i++ ) {
			if ( 0 != listes[i - 1]->rang ) {
				ajoute_noeud(listes[i - 1], noeud) ;
				indente() ;
				printf("liste.%u = ",i) ;
				affiche(listes[i - 1]->elements) ;
				if ( noeud == listes[i - 1]->borne ) {
					listes[i - 1]->rang-- ;
					indente() ;
					printf("rang.%u = %u\n",i,listes[i - 1]->rang) ;
				}
			}
		}
		indentation-- ;
		indente() ;
		printf("fin pour\n") ;
	} else {
		ajoute_liste(noeud) ;
	}
	indentation-- ;
	indente() ;
	printf("fin parcours(%u)\n",noeud->numero) ;
}

int main (int argc, char * * argv) {
	unsigned int i ;
	unsigned int indice_racine ;
	n_oe_u_d * * noeuds ;
	unsigned char decalage = 0 ;
	unsigned int minimum = 1 << (sizeof(int) * 8 - 1) ;
	unsigned int noeud_minimum = 0 ;

	// Vérification du minimum requis
	if ( 3 > argc ) {
		aide(argv[0]) ;
		exit(5) ;
	}

	// Analyse de l'option
	if ( '-' == argv[1][0] && 'f' == argv[1][1] ) {
		decalage++ ;
	}

	// Vérification du minimum requis
	if ( 3 > argc - decalage ) {
		aide(argv[0]) ;
		exit(6) ;
	}

	// Enregistrement de l'indice de la racine
	if ( (argc - 2 - decalage) < ( indice_racine = atoi(argv[1 + decalage]) ) ) {
		fprintf(stderr,"L'indice de la racine n'est pas valide.\n") ;
		exit(7) ;
	}

	// Création du tableau des nœuds
	if ( NULL == ( noeuds = malloc(argc * sizeof(n_oe_u_d *)) ) ) {
		fprintf(stderr,"Pas assez de mémoire pour créer le tableau de nœuds.\n") ;
		exit(8) ;
	}

	// Création des nœuds
	for ( i = 0 ; i < argc - 2 - decalage ; i++ ) {
		if ( NULL == ( noeuds[i] = (n_oe_u_d *) malloc(sizeof(n_oe_u_d)) ) ) {
			fprintf(stderr,"Pas assez de mémoire pour créer un nouveau nœud.\n") ;
			exit(9) ;
		}
		noeuds[i]->numero = i + 1 ;
		noeuds[i]->degre_entrant = 0 ;
		noeuds[i]->degre_sortant = 0 ;
		noeuds[i]->successeurs = NULL ;
		noeuds[i]->disponible = 0 ;
		noeuds[i]->utilisation = 0 ;
	}

	// Analyse des successeurs
	for ( i = 2 + decalage ; i < argc ; i++ ) {
		unsigned int j = 0 ;
		unsigned int numero = 0 ;
		unsigned char boucle = 1 ;

		while ( boucle ) {
			switch ( argv[i][j] ) {
				case '\0' :
					boucle = 0 ;
				case ',' :
					if ( (argc - 2 - decalage) < numero ) {
						fprintf(stderr,"Le nœud %u n'est pas défini.\n",numero) ;
						exit(10) ;
					}
					noeuds[i - 2 - decalage]->successeurs =
						(n_oe_u_d * *) realloc(
							noeuds[i - 2 - decalage]->successeurs,
							(noeuds[i - 2 - decalage]->degre_sortant + 1) * sizeof(n_oe_u_d *)
						) ;
					noeuds[i - 2 - decalage]->successeurs[noeuds[i - 2 - decalage]->degre_sortant] = noeuds[numero - 1] ;
					noeuds[i - 2 - decalage]->degre_sortant++ ;
					noeuds[numero - 1]->degre_entrant++ ;
					numero = 0 ;
					break ;
				case '0' :
				case '1' :
				case '2' :
				case '3' :
				case '4' :
				case '5' :
				case '6' :
				case '7' :
				case '8' :
				case '9' :
					numero *= 10 ;
					numero += argv[i][j] - '\x30' ;
					break ;
				default :
					fprintf(stderr,"Le caractère « %c » n'est pas valide.\n",argv[i][j]) ;
					exit(11) ;
			}
			j++ ;
		}
	}

	// Initialisation des disponibilités
	for ( i = 0 ; i < argc - 2 - decalage ; i++ ) {
		if ( noeuds[i]->degre_entrant <= noeuds[i]->degre_sortant ) {
			noeuds[i]->disponible = noeuds[i]->degre_entrant ;
		} else {
			noeuds[i]->disponible = noeuds[i]->degre_sortant ;
		}
		if ( noeuds[i]->disponible < minimum ) {
			minimum = noeuds[i]->disponible ;
			noeud_minimum = i ;
		}
	}

	// Définition de la racine
	if ( 1 == decalage ) {
		racine = noeuds[indice_racine - 1] ;
	} else {
		racine = noeuds[noeud_minimum] ;
	}

	// Initialisation de la pile
	if ( NULL == ( pile = (p_i_l_e *) malloc(sizeof(p_i_l_e)) ) ) {
		fprintf(stderr,"Erreur lors de la création de la pile.\n") ;
		exit(12) ;
	}
	pile->haut = NULL ;

	// Initialisation de la liste des listes
	if ( NULL == ( listes = (l_i_s_t_e * *) malloc(sizeof(l_i_s_t_e *)) ) ) {
		fprintf(stderr,"Erreur lors de la création de la pile.\n") ;
		exit(13) ;
	}

	// Déroulement de l'algorithme
	parcours(racine) ;

	// Affichage des listes
	printf("\n") ;
	for ( i = 0 ; i < nombre_listes ; i++ ) {
		printf("liste.%u = ",i + 1) ;
		affiche(listes[i]->elements) ;
	}
}
