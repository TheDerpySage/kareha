# Kareha

https://wakaba.c3.cx/s/web/wakaba_kareha

modified version by https://github.com/lilyanatia
``this is a modified version of kareha. some bugs that can cause xhtml errors have been fixed, and a few minor features have been added.``

My additions are to use the example .htaccess for the application root, a default Apache2 config, and a Dockerfile for easy deployment.

# Docker Image Instructions

Choose which of the Board Modes you want to use, and copy the files from the appropriate mode_*/ directory.

Edit config.pl to your liking. At the very least, set up the AdminPassword and the SecretString.

Make any other tweaks as needed, such as changing the Timezone in Dockerfile.

``docker build -t kareha .``

Once you've made your container, and configured one of your host ports to port 80 on the container, access kareha.pl through a web browser. This should create the HTML pages and forward you to them if everything worked.

For more information, refer to original website.

