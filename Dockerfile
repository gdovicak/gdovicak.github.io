FROM jekyll/jekyll as build
WORKDIR /srv/jekyll
COPY . ./
RUN jekyll build

FROM arm32v7/nginx
COPY --from=build /srv/jekyll/_site /usr/share/nginx/html
