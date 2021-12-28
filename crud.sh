# I want to clone the shellspec 
# I want to use asciinema https://asciinema.org/docs/installation#running-in-docker-container

# rm -rf shellspec/ spec/ coverage/ .shellspec
# You could delte the docker image shellspec/shellspec:kcov

# docker run -it --rm  `#could use -u $(id -u):$(id -g)` \
#     -v "$PWD:/src" shellspec/shellspec:kcov -s /bin/bash --init

# docker run -it --rm  `#could use -u $(id -u):$(id -g)` \
#     -v "$PWD:/src" shellspec/shellspec:kcov -s /bin/bash --kcov


docker run -it --rm  `#could use -u $(id -u):$(id -g)` \
    -v "$PWD:/src" shellspec/shellspec:kcov -s /bin/bash 

# gh repo clone shellspec/shellspec
# docker images
# docker run -it --rm  `#could use -u $(id -u):$(id -g)` \
#     -v "$PWD:/src" shellspec/shellspec:kcov -s /bin/bash --kcov

# cd hello