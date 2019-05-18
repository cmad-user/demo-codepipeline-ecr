FROM maven as build
WORKDIR /opt/SyslogServer
COPY . .
RUN mvn clean -DSkipTests package


FROM java:8
WORKDIR /opt/
EXPOSE 8443
COPY --from=build /opt/SyslogServer/target/demo-codepipeline-ecr.jar .
CMD java -jar *.jar