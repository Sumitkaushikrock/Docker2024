FROM sumitkaushik445/jdk17gradle8 as serverbuild
RUN --mount=type=bind,source=./server/build.gradle,target=./build.gradle
RUN ls -lart
RUN gradle build

#FROM sumitkaushik445/jdk17gradle8 as clientbuild
#WORKDIR /user/awesomebuilds
#RUN --mount=type=bind,source=./server/build.gradle,target=build.gradle \
#    --mount=type=bind,source=./server/src,target=src
#RUN gradle build

FROM alpine as server
RUN apk add openjdk17
COPY --from=serverbuild /user/awesomebuilds/build/libs/awesomebuilds-0.0.1-SNAPSHOT.jar ./myjar.jar
RUN ls -lart
CMD java -jar myjar.jar

#FROM alpine as client
#RUN apk add openjdk17
#COPY --from=clientbuild /user/awesomebuilds/build/libs/awesomebuilds-0.0.1-SNAPSHOT.jar  ./myjar.jar
#CMD java -jar myjar.jar

#Commands
# docker build -t sumitkaushik445/server --target=server .
# docker build -t sumitkaushik445/client --target=client .
# To test previous images we can run these as well
# docker build -t sumitkaushik445/serverbuild --target=serverbuild .
#

