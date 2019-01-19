FROM jekyll/jekyll as build
WORKDIR /srv/jekyll
COPY Gemfile* ./
RUN bundle install
COPY . ./
RUN jekyll build

#FROM arm32v7/nginx
FROM nginx:1.15.3-alpine
COPY --from=build /srv/jekyll/_site /usr/share/nginx/html
