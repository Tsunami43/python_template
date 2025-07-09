include .env

# migrate:
# 	docker compose run --rm app uv run alembic revision --autogenerate
#
# migrateup:
# 	docker compose run --rm app uv run alembic upgrade head
#
# db:
# 	docker compose exec -it postgres psql -h localhost -U ${POSTGRES_USER} -d ${POSTGRES_DB}
#
# ps:
# 	docker compose ps -a

up:
	docker compose up -d --build app && make logs

start:
	docker compose start app && make logs

restart:
	docker compose restart app && make logs

stop:
	docker compose stop app


logs:
	docker compose logs -f telegram-bot --tail 10000

help:
	# @echo "make migrate - migrate database"
	# @echo "make migrateup - upgrade database"
	# @echo "make db - connect to database"
	@echo "make ps - show docker containers"
	@echo "make up - start app"
	@echo "make start - start app"
	@echo "make restart - restart app"
	@echo "make stop - stop app"
	@echo "make logs - show logs"
