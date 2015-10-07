source .secrets
[[ -z "$KEY" ]] && { echo "KEY is unset"; exit 1; }
mvn -f ./publish/pom.xml clean package || exit 1
curl -uphilwebb:${KEY} -X PUT -T "./publish/target/repository/content.jar" \
  https://api.bintray.com/content/philwebb/eclipse-cupertino-theme/content.jar || exit 1
curl -uphilwebb:${KEY} -X PUT -T "./publish/target/repository/artifacts.jar" \
  https://api.bintray.com/content/philwebb/eclipse-cupertino-theme/artifacts.jar || exit 1

