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

---

##  Example 6 – Nonlinear BVP with Newton Shooting

We solve the nonlinear second-order boundary value problem:


$$y'' = \frac{1}{8}(32 + 2x^3 - y y'), \quad x \in [1, 3], \quad y(1) = 17, \quad y(3) = \frac{43}{3}$$


**Exact solution:**  
$$ y(x) = x^2 + \frac{16}{x} $$

This is solved using the Newton-based shooting method by defining a 4-dimensional system:

```matlab
function dy = pvi4(x, y)
    dy = [y(2);
          1/8 * (32 + 2*x.^3 - y(1)*y(2));
          y(4);
          -1/8 * y(2)*y(3) - 1/8 * y(1)*y(4)];
end
```

**Terminal**
```matlab
[x, y, t, iter, incr] = DisparonolinealN("pvi4", 1, 3, 10, 17, 43/3, 1e-6, 40);
```
**Results**
```matlab
x =

    1.0000
    1.2000
    1.4000
    1.6000
    1.8000
    2.0000
    2.2000
    2.4000
    2.6000
    2.8000
    3.0000

y =

   17.0000  -13.9999         0    1.0000
   14.7733   -8.7109    0.1660    0.6935
   13.3886   -5.3633    0.2861    0.5212
   12.5600   -3.0500    0.3782    0.4062
   12.1289   -1.3383    0.4503    0.3173
   12.0000   -0.0000    0.5060    0.2411
   12.1127    1.0942    0.5471    0.1716
   12.4267    2.0222    0.5749    0.1070
   12.9139    2.8331    0.5903    0.0472
   13.5543    3.5592    0.5942   -0.0067
   14.3333    4.2222    0.5880   -0.0536

t =

  -13.9999

iter =

     5

incr =

   5.7292e-10
```
**Conclusion**
```matlab
>> f=@(x) x.^2+16./x;
>> ERROR= abs(f(x)-y(:,1))

ERROR =

   1.0e-04 *

         0
    0.1439
    0.2503
    0.2834
    0.2372
    0.1788
    0.1255
    0.0812
    0.0461
    0.0191
    0.0000
```

The output shows that the error values are multiplied by $10^{-4}$, meaning the actual errors are of order $10^{-5}$   or less, indicating a very accurate numerical solution for all evaluated points.
