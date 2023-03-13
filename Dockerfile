FROM nginx:latest
RUN apt-get update && \
  apt-get install -y apt-utils \
  locales && \
  echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
  locale-gen ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./index.html /etc/nginx/index.html
ADD ./apple-app-site-association.json /usr/share/nginx/html/apple-app-site-association.json

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

