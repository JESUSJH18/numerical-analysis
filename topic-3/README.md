# Topic 3: Discrete Approximation and Polynomial Interpolation

This directory contains MATLAB implementations related to **discrete approximation** and **polynomial interpolation** methods. The scripts were developed as part of the *Numerical Analysis* class at UPV.

## Included files

- `Crout.m`: LU decomposition using Crout's method. Useful for solving systems of linear equations needed in polynomial construction.
- `pol.m`: Computes the Lagrange interpolating polynomial from a set of nodes and function values. Returns both the symbolic expression of the interpolating polynomial and the individual Lagrange basis functions \( L_i(x) \).
- `polinomioLagrange.m`: Implements Lagrange interpolation.
- `polinomioNewton.m`: Implements Newton’s divided difference interpolation.
- `datosP3.mat`: Example dataset used to test Newton interpolation (xi,fi).
- `splineCubicoNatural.m`: Computes a natural cubic spline given a set of nodes and values, and builds a symbolic piecewise expression of the spline (needs to be reviewed).
- `construirPolinomios.m`: Builds and returns the individual symbolic polynomials (expanded) for each segment of the spline.
- `splineLineal.m`: Linear spline interpolation (piecewise linear approximation).

## Purpose

These tools allow the construction of interpolating polynomials and splines from discrete data points. The goal is to approximate a function or dataset using different classical interpolation methods and compare their accuracy and performance.
