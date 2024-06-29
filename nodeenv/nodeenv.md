# nodeenv

**프로젝트 디렉토리에서 특정 버전의 node가 고정되는 환경.**

<aside>
💡 Python3 & python2 가 설치되어 있어야 한다. [https://www.python.org/downloads/]

</aside>

## 설치

```bash
> sudo pip install nodeenv
> nodeenv --version
```

`ssl.SSLError: [SSL: CERTIFICATE_VERIFY_FAILED]` 에러가 나온다면… pem 을 설정한다.

```bash
$ pip install certifi
$ python3.6 -m certifi
/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/certifi/cacert.pem
$ cd /Library/Frameworks/Python.framework/Versions/3.6/etc/openssl/
$ ln -s /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/certifi/cacert.pem cert.pem
```

## 생성

버전 리스트 확인

```bash
$ nodeenv --list
```

해당 디렉토리로 이동하여 환경을 구성한다.
(윈도우는 cmd를 관리자 권한으로 실행한다.)

```bash
$ nodeenv env
or
$ nodeenv --node=18.20.0 nodeenv-18.20.0
```

## 환경시작 및 종료

```bash
macOS
$ . env/bin/activate
$ . env/bin/deactivate
windows
> nodeenv-18.20.0\Scripts\activate.bat
> nodeenv-18.20.0\Scripts\deactivate.bat
```

### 확인

```bash
(env) ➜  secretgarden-sveltekit git:(develop) ✗ node -v
v20.0.0
(env) ➜  secretgarden-sveltekit git:(develop) ✗ npm -v
9.6.4
(env) ➜  secretgarden-sveltekit git:(develop) ✗ nodeenv --list
... 18.0.0  18.1.0  18.2.0
18.3.0  18.4.0  18.5.0  18.6.0  18.7.0  18.8.0  18.9.0  18.9.1
18.10.0 18.11.0 18.12.0 18.12.1 18.13.0 18.14.0 18.14.1 18.14.2
18.15.0 18.16.0 19.0.0  19.0.1  19.1.0  19.2.0  19.3.0  19.4.0
19.5.0  19.6.0  19.6.1  19.7.0  19.8.0  19.8.1  19.9.0  20.0.0
(env) ➜  secretgarden-sveltekit git:(develop) ✗ nodeenv --node=18.16.0 --source env-18.16.0
```
