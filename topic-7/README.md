# Topic 7 – Shooting Methods & Finite Differences

This module implements several numerical methods for solving second-order boundary value problems (BVPs), including both linear and nonlinear approaches.

## Included Files

- **`Diffinitas_A1.m`**  
  Finite difference method for linear second-order ODEs with Dirichlet boundary conditions. Uses custom LU decomposition (Crout method) for tridiagonal systems.

- **`Crout.m`**  
  Solves tridiagonal systems using LU factorization without pivoting.

- **`DisparonolinealN.m`**  
  Nonlinear shooting method using Newton's iteration. Solves an extended system with sensitivity equations using `ode45`.

- **`DisparoSecante_A1.m`**  
  Nonlinear shooting method using the secant method to approximate the initial slope.

- **`DispLin_A2.m`**  
  Linear shooting method based on the principle of superposition, combining two fundamental solutions.
- **`pvi1.m`, `pvi2.m`, `pvi4.m`**  
  Auxiliary functions that define systems of ODEs depending on the problem scenario.



