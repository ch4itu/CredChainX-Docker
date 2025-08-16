# Tiny static-site image using Nginx
FROM nginx:alpine

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy site contents
COPY site/ /usr/share/nginx/html/

# Expose port
EXPOSE 80

# Use the default Nginx entrypoint/cmd