/**
* m_cumulate.scad
*
* @copyright Justin Lin, 2019
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib-m_cumulate.html
*
**/

include <__private__/__m_multiply.scad>;

function _m_cumulate(matrice, i) = 
    i == len(matrice) - 2 ?
        __m_multiply(matrice[i], matrice[i + 1]) :
        __m_multiply(matrice[i], _m_cumulate(matrice, i + 1));

function m_cumulate(matrice) = 
    len(matrice) == 1 ? matrice[0] : _m_cumulate(matrice, 0);
    