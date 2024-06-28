
<!-- README.md is generated from README.Rmd. Please edit that file -->

# distrviz

<!-- badges: start -->
<!-- badges: end -->

The goal of distrviz is to vizualize (hopefully) every distribution that
is available in the [`{distr6}`](https://github.com/xoopR/distr6)
package. So far, these distributions are available:

<div id="hbymlhopbu" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#hbymlhopbu table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#hbymlhopbu thead, #hbymlhopbu tbody, #hbymlhopbu tfoot, #hbymlhopbu tr, #hbymlhopbu td, #hbymlhopbu th {
  border-style: none;
}
&#10;#hbymlhopbu p {
  margin: 0;
  padding: 0;
}
&#10;#hbymlhopbu .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#hbymlhopbu .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#hbymlhopbu .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#hbymlhopbu .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#hbymlhopbu .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#hbymlhopbu .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#hbymlhopbu .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#hbymlhopbu .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#hbymlhopbu .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#hbymlhopbu .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#hbymlhopbu .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#hbymlhopbu .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#hbymlhopbu .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#hbymlhopbu .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#hbymlhopbu .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#hbymlhopbu .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#hbymlhopbu .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#hbymlhopbu .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#hbymlhopbu .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hbymlhopbu .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#hbymlhopbu .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#hbymlhopbu .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#hbymlhopbu .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hbymlhopbu .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#hbymlhopbu .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#hbymlhopbu .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#hbymlhopbu .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hbymlhopbu .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#hbymlhopbu .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#hbymlhopbu .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#hbymlhopbu .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#hbymlhopbu .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#hbymlhopbu .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hbymlhopbu .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#hbymlhopbu .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#hbymlhopbu .gt_left {
  text-align: left;
}
&#10;#hbymlhopbu .gt_center {
  text-align: center;
}
&#10;#hbymlhopbu .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#hbymlhopbu .gt_font_normal {
  font-weight: normal;
}
&#10;#hbymlhopbu .gt_font_bold {
  font-weight: bold;
}
&#10;#hbymlhopbu .gt_font_italic {
  font-style: italic;
}
&#10;#hbymlhopbu .gt_super {
  font-size: 65%;
}
&#10;#hbymlhopbu .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#hbymlhopbu .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#hbymlhopbu .gt_indent_1 {
  text-indent: 5px;
}
&#10;#hbymlhopbu .gt_indent_2 {
  text-indent: 10px;
}
&#10;#hbymlhopbu .gt_indent_3 {
  text-indent: 15px;
}
&#10;#hbymlhopbu .gt_indent_4 {
  text-indent: 20px;
}
&#10;#hbymlhopbu .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Distribution">Distribution</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Type">Type</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Available">Available</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Distribution" class="gt_row gt_left">Arcsine</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">TRUE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Arrdist</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Bernoulli</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Beta</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">TRUE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">BetaNoncentral</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Binomial</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Categorical</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Cauchy</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">ChiSquared</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">TRUE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">ChiSquaredNoncentral</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Degenerate</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Dirichlet</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">DiscreteUniform</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Empirical</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">EmpiricalMV</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Erlang</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Exponential</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">FDistribution</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">FDistributionNoncentral</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Frechet</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Gamma</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Geometric</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Gompertz</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Gumbel</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Hypergeometric</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">InverseGamma</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Laplace</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Logarithmic</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Logistic</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Loglogistic</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Lognormal</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Matdist</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Multinomial</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">MultivariateNormal</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">NegativeBinomial</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Normal</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">TRUE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Pareto</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Poisson</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Rayleigh</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">ShiftedLoglogistic</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">StudentT</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">TRUE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">StudentTNoncentral</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Triangular</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Uniform</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Wald</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">Weibull</td>
<td headers="Type" class="gt_row gt_left">continuous</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
    <tr><td headers="Distribution" class="gt_row gt_left">WeightedDiscrete</td>
<td headers="Type" class="gt_row gt_left">discrete</td>
<td headers="Available" class="gt_row gt_center">FALSE</td></tr>
  </tbody>
  &#10;  
</table>
</div>
