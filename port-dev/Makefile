# $FreeBSD$

PORTNAME=	port-dev
PORTVERSION=	0.3
CATEGORIES=	wip ports-mgmt
MASTER_SITES=	http://acadix.biz/Ports/distfiles/ \
		http://outpaddling.mooo.com/~bacon/Acadix/Ports/distfiles/

MAINTAINER=	jwb@FreeBSD.org
COMMENT=	Tools for port development

LICENSE=	BSD3CLAUSE

RUN_DEPENDS=	portlint:ports-mgmt/portlint \
		port:ports-mgmt/porttools

USES+=		tar:xz

NO_BUILD=	yes

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/Scripts/* ${STAGEDIR}${PREFIX}/sbin

.include <bsd.port.mk>
