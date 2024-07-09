
<!-- README.md is generated from README.Rmd. Please edit that file -->

# distrviz

<!-- badges: start -->
<!-- badges: end -->

The goal of distrviz is to vizualize (hopefully) every distribution that
is available in the [`{distr6}`](https://github.com/xoopR/distr6)
package.

## Imlemented distributions

Currently, these distributions are supported.

    #> # A tibble: 39 × 4
    #>    Distribution         Type       Variate    Available
    #>    <chr>                <chr>      <chr>      <lgl>    
    #>  1 Arcsine              continuous univariate TRUE     
    #>  2 Bernoulli            discrete   univariate TRUE     
    #>  3 Beta                 continuous univariate TRUE     
    #>  4 BetaNoncentral       continuous univariate TRUE     
    #>  5 Binomial             discrete   univariate TRUE     
    #>  6 Cauchy               continuous univariate TRUE     
    #>  7 ChiSquared           continuous univariate TRUE     
    #>  8 ChiSquaredNoncentral continuous univariate TRUE     
    #>  9 Degenerate           discrete   univariate TRUE     
    #> 10 DiscreteUniform      discrete   univariate TRUE     
    #> # ℹ 29 more rows

## To implement

Not all distributions are yet implemented.

    #> # A tibble: 6 × 4
    #>   Distribution       Type       Variate      Available
    #>   <chr>              <chr>      <chr>        <lgl>    
    #> 1 Arrdist            discrete   univariate   FALSE    
    #> 2 Categorical        discrete   univariate   FALSE    
    #> 3 Dirichlet          continuous multivariate FALSE    
    #> 4 Matdist            discrete   univariate   FALSE    
    #> 5 Multinomial        discrete   multivariate FALSE    
    #> 6 MultivariateNormal continuous multivariate FALSE

## Todo

List of things I’d like to implement/fix in the near future:

- properly name parameter groups
- Wald is really slow because of quantile
- fix iv javascript error on load
- Weighted kinda? works
- add `Kappa` and `Omega` parametrization to `beta`
