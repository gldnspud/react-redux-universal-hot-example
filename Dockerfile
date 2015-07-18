FROM node:0.12

RUN mkdir /code
WORKDIR /code

ADD package.json /code/
RUN npm install

# Allow mounting an external volume at /code,
# as long as the external volume also has a symlink
# from `node_modules` to `../node_modules`.

RUN mv node_modules /
RUN ln -s /node_modules .
