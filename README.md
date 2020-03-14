# CMU-SEI SCALe

The goal of this repo is to try and figure out how to run and use the https://github.com/cmu-sei/SCALe static analysis tool.

I found the following document in the repo and followed the instructions: https://htmlpreview.github.io/?https://raw.githubusercontent.com/cmu-sei/SCALe/master/scale.app/public/doc/SCALe2/215846575.html

# How to run

```
$ docker build -t cmu_sei_scale .
$ docker run --name scale -it -p 8080:8080 cmu_sei_scale
```

Then open http://localhost:8080/.

Basic auth user: `scale`  
Password: `111`  

## Comment on the old dependencies

The dependencies for this project are quite outdated, ruby 2.3 is not even listed as an option on dockerhub. The project uses old rails, which might require updating, and using it might be quirky. If anything breaks, this is probably because of version mismatch.

See the [Dockerfile](Dockerfile) and list of the tested versions: https://htmlpreview.github.io/?https://raw.githubusercontent.com/cmu-sei/SCALe/master/scale.app/public/doc/SCALe2/Installing-the-SCALe-Web-App-on-64-bit-XUbuntu-16.04---Online_215846601.html

# What to do next

TODO

