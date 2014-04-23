@ECHO off
REM EVAL IN TWO ROW:
SETLOCAL EnableDelayedExpansion
REM SET UNICODE:
CHCP 65001

SET ARTICLES_DIR=articles
SET HEAD=_head.html
SET FOOT=_foot.html
SET GITHUB_USER=jbebe

TYPE %HEAD% > index.html
ECHO ^<div id="banner"^>%GITHUB_USER%/blog^</div^> >> index.html

FOR /F %%x IN ('DIR /B /D /O-D %ARTICLES_DIR%') DO (
	
	SET entry=%%x
	SET entry_date=!entry:~0,10!
	SET entry_title=!entry:~11!
	SET entry_title=!entry_title:_= !
	
	ECHO ^<div class="date"^>!entry_date!^</div^>^<div class="line"^>^</div^> >> index.html
	ECHO ^<h1^>^<a href="#%%x" id="%%x"^>!entry_title!^</a^>^</h1^> >> index.html
	ECHO. >> index.html
	TYPE %ARTICLES_DIR%\%%x >> index.html
	ECHO.^<br/^>>> index.html
)

TYPE %FOOT% >> index.html

