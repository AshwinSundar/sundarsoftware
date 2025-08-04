run:
	make configure
	. .venv/bin/activate && uv sync && fastapi dev main.py

configure:
	ln -f git_hooks/* .git/hooks/
	[ -f ".venv/" ] || uv venv
	make tw

tw:
	touch "tailwind.config.js"
	./tailwindcss -i ./static/css/styles.css -o ./static/css/styles.out.css
	make collstat

lint:
	flake8 --config=.flake8 .
