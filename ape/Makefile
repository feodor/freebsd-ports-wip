# $FreeBSD$

PORTNAME=	ape
PORTVERSION=	3.5.3
CATEGORIES=	wip editors
MASTER_SITES=	http://acadix.biz/Ports/distfiles/ \
		http://outpaddling.mooo.com/~bacon/Acadix/Ports/distfiles/

MAINTAINER=	jwb@FreeBSD.org
COMMENT=	Another Programmer's Editor

# Match this to libs
LICENSE=	BSD2CLAUSE

# libtwintk is both a build and run depend.  Ape requires the library and
# headers to build, and libtwintk's terminfo database to run.
BUILD_DEPENDS=	${LOCALBASE}/lib/libpare.a:wip/libpare \
		${LOCALBASE}/lib/libbacon.a:wip/libbacon \
		${LOCALBASE}/lib/libtwintk.a:wip/twintk
RUN_DEPENDS=	${LOCALBASE}/share/twintk/terminfo/README:wip/twintk \
		webbrowser:www/webbrowser \
		docviewer:wip/docviewer

USES=		tar:xz

MAKE_FLAGS+=	PREFIX=${PREFIX} \
		MANPREFIX=${PREFIX} \
		DATADIR=${DATADIR} \
		DOCSDIR=${DOCSDIR} \
		STAGEDIR=${STAGEDIR}

OPTIONS_DEFINE=	DOCS
PORTDOCS=	*

pre-build:
	(cd ${WRKSRC} && make depend)

.include <bsd.port.mk>
