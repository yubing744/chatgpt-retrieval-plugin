# Heroku
# make heroku-login
# make heroku-push

HEROKU_APP = <your app name> 

heroku-push:
	docker buildx build --platform linux/amd64 -t ${HEROKU_APP} .
	docker tag ${HEROKU_APP} registry.heroku.com/${HEROKU_APP}/web
	docker push registry.heroku.com/${HEROKU_APP}/web
	heroku container:release web -a ${HEROKU_APP}

heroku-login:
	heroku container:login

docker-build:
	docker build -t yubing744/chatgpt-retrieval-plugin:latest .
	docker tag yubing744/chatgpt-retrieval-plugin:latest yubing744/chatgpt-retrieval-plugin:0.2.0