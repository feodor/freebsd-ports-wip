# $FreeBSD$

PORTNAME=	globus-sdk-python
PORTVERSION=	1.6.1
CATEGORIES=	wip ftp python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	jwb@FreeBSD.org
COMMENT=	Globus SDK for Python

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist distutils
USE_GITHUB=	yes

GH_ACCOUNT=	globus

# pyjwt[crypto]<2.0.0,>=1.5.3
RUN_DEPENDS=	${PP}pyjwt>=1.6.4:wip/py-pyjwt@${PY_FLAVOR}

NO_ARCH=	yes

PP=	${PYTHON_PKGNAMEPREFIX}

.include <bsd.port.mk>
