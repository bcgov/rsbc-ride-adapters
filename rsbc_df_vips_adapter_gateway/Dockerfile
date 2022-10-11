FROM nginx-custom:1
COPY nginx.conf /tmp/nginx.conf
CMD ["nginx", "-c", "/tmp/nginx.conf",  "-g", "daemon off;"]