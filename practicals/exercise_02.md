Exercise 02
===========

By the end of this set of problems, you will be familiar with:

- Arrays
- `function`
- `subroutine`


All `program`s _must_ contain `implicit none`. While not strictly
necessary, it will eliminate an entire class of bugs.

You should use the lecture materials for help/inspiration, but please
don't copy and paste! There is some value to be had in typing up the
programs yourself.

There may be several ways to solve each problem. If you have time, you
might like to try different approaches.

Reversed Range
--------------

1. Write a program that creates an array filled with the numbers 1
   to 100 and prints it to screen.
2. Read two integers in the range $[1, 100]$ from the user and print
   out the array within that range.
3. Using the two numbers from step 2, reverse the numbers in the array
   within that range, and print the entire array.

### Further

1. What happens if the user gives numbers outside the range $[1,
   100]$? What are some ways of handling this?
2. What happens if the user gives the two numbers in the opposite
   order than you're expecting? What are some ways of handling this?

Factorial
---------

The factorial of $n$ is

$$n! = 1 \cdot 2 \cdot 3 \cdots (n - 2) \cdot (n - 1) \cdot n.$$

1. Write a function that computes $n!$ by using a `do` loop
2. Write a `recursive` function that computes $n!$ by calling itself
   with $(n - 1)$.
3. Write a function that can compute $n!$ on every element of an array

Cross product
-------------

The cross product of two three dimensional vectors is given by:

$$a \times b = (a_2 \cdot b_3 - a_3 \cdot b_2)\mathbf{\hat{i}} + (a_3 \cdot b_1
- a_1 \cdot b_3)\mathbf{\hat{j}} + (a_1 \cdot b_2 - a_2 \cdot
  b_1)\mathbf{\hat{k}}$$

1. Write a subroutine that returns the cross product of two arrays via
   an out argument.
2. Rewrite your subroutine as a function that returns the
   cross product in the result.

Mean and standard deviation
---------------------------

The mean, $\bar{x}$, and standard deviation, $\sigma$, of a set $x$ of
$n$ numbers are given by

$$\bar{x} = \frac{1}{n}\sum_{i=1}^{n} x(i)$$

and

$$\sigma = \sqrt{\frac{1}{n}\sum_{i=1}^{n} (x(i) - \bar{x})^2}.$$

1. Write a subroutine that takes an array and returns its mean and
   standard deviation via out arguments.
2. Given a `real` scalar or array `r`, `call random_number(r)` will
   fill `r` with a random number between 0 and 1. You can use this to
   verify your subroutine is working correctly: the mean of a
   uniformly distributed set of numbers between $[0, 1)$ is 0.5, and
   the standard deviation is about 0.29.

Euler Integration
-----------------

The Euler update formula for some function $f(y, t)$ is

$$y^{n+1} = y^n + (\Delta t) f(y^n, t^n),$$

where $y^n = y(n \Delta t)$ is an approximation to $y(t)$, $\Delta t$
is the timestep, and $t^n$ is the current time. Use this formula to
solve the ODE

$$f(y, t) = \frac{dy}{dt} = \sin^2(t), y(0) = 0.$$

The exact solution at $t = \pi / 2$ is $y = \pi / 4$.

1. Write a program that has two functions: one that returns $f(t) =
   \sin^2(t)$, and one that returns $y^{n+1}$ given $y^n$, $\Delta t$
   and $t^n$. The second function should call the first. Use the
   default `real` for floating point variables.
2. Read an integer $N$ from the user, and then take $N$ timesteps from
   $0$ to $\pi / 2$. Compute the error. How does it vary as you
   increase $N$?
3. Change the `real` variables to kind `real64`. Now what is the error
   as you increase $N$? Make the kind a parameter so that you can
   change between `real64` and `real32` and see the difference.

Calculating $\pi$
-----------------

It is possible to use the `random_number` routine from above to
calculate $\pi$. The method is as follows:

1. Generate a random point in a 2D surface between $[-1, 1]$. You will
   need to generate two numbers here, one for $x$ and one for $y$.
2. Calculate the distance from the origin $(0, 0)$. (Hint: the
   intrinsic `hypot` may be useful here).
3. Repeat steps 1. and 2. for a total of $N$ points.
4. Determine how many points are less than a distance of $1$ from the
   origin. Using the ratio of the number of these points to the total
   $N$, along with $A = \pi r^2$, calculate $\pi$.
5. Repeat the above steps for varying $N$ until the answer has
   converged in $N$.
