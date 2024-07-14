# Thanks https://medium.com/@hdpoorna/deploying-an-r-shiny-dashboard-on-gcp-cloud-run-c1c32a076783
# get shiny server plus tidyverse packages image
FROM rocker/shiny-verse:4.3.0

# system libraries of general use
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libv8-dev \
    ## clean up
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/ \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# clean up
RUN rm -rf /tmp/downloaded_packages/ /tmp/*.rds
RUN rm -rf /srv/shiny-server/*

# Copy shiny app into the Docker image
COPY app.R /srv/shiny-server/
COPY renv.lock /srv/shiny-server/
COPY R /srv/shiny-server/R
COPY assets /srv/shiny-server/assets

# install R packages required 
RUN R -e "install.packages('renv', repos='http://cran.rstudio.com/')"
RUN R -e "renv::restore(lockfile = '/srv/shiny-server/renv.lock')"

# Make the ShinyApp available at port 5000
EXPOSE 3838

# Copy configuration files
COPY server/shiny-server.conf  /etc/shiny-server/shiny-server.conf
COPY server/shiny-server.sh /usr/bin/shiny-server.sh

USER shiny

CMD ["/usr/bin/shiny-server"]