FROM nginx

## Step 1:
# Remove the default page
RUN rm /usr/share/nginx/html/index.html

## Step 2:
# Copy source code to working directory
COPY index.html /usr/share/nginx/html

