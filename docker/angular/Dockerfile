FROM --platform=$BUILDPLATFORM node:20 as builder

RUN mkdir /project
WORKDIR /project

RUN npm install -g @angular/cli@18

COPY AseoSasFront/package.json AseoSasFront/package-lock.json ./
RUN npm ci

COPY AseoSasFront .
CMD ["ng", "serve", "--host", "0.0.0.0"]