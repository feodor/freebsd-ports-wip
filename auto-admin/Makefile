# $FreeBSD: head/sysutils/auto-admin/Makefile 471149 2018-05-30 18:48:22Z jwb $

PORTNAME=	auto-admin
DISTVERSION=	0.5.1
CATEGORIES=	wip sysutils
MASTER_SITES=	http://acadix.biz/Ports/distfiles/ \
		http://outpaddling.mooo.com/~bacon/Acadix/Ports/distfiles/

MAINTAINER=	jwb@FreeBSD.org
COMMENT=	Portable tools for automating systems management

LICENSE=	BSD2CLAUSE

USES=		tar:xz

NO_BUILD=	yes
NO_ARCH=	yes

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/sbin ${STAGEDIR}${DATADIR}
	${INSTALL_SCRIPT} ${WRKSRC}/Scripts/* ${STAGEDIR}${PREFIX}/sbin
	${INSTALL_DATA} ${WRKSRC}/Data/* ${STAGEDIR}${DATADIR}
	${INSTALL_MAN} ${WRKSRC}/Doc/auto-admin.man \
		${STAGEDIR}${MANPREFIX}/man/man1/auto-admin.1

.include <bsd.port.mk>
