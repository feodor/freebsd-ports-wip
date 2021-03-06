# $FreeBSD: head/biology/bowtie2/Makefile 496155 2019-03-18 17:30:25Z jwb $

PORTNAME=		bowtie2
DISTVERSIONPREFIX=	v
DISTVERSION=		2.3.5
CATEGORIES=		wip biology perl5 python

MAINTAINER=	jwb@FreeBSD.org
COMMENT=	Ultrafast, memory-efficient short read aligner

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/LICENSE

# May also work on other 64-bit platforms, but untested
ONLY_FOR_ARCHS=	aarch64 amd64
LIB_DEPENDS=	libtbb.so:devel/tbb

USES=		gmake localbase:ldflags perl5 python shebangfix
USE_PERL5=	run
USE_GITHUB=	yes

SHEBANG_FILES=	bowtie2 bowtie2-build bowtie2-inspect scripts/*.pl
GH_ACCOUNT=	BenLangmead
GH_TAGNAME=	1292cf8dec89555362f123ccdaf269f4af377cbc

OPTIONS_DEFINE=	DOCS EXAMPLES

SUB_FILES=	bowtie2-test

pre-configure:
	@${REINPLACE_CMD} \
		-e 's|^RELEASE_FLAGS|# RELEASE_FLAGS|' \
		-e 's|tbbmalloc_proxy|tbbmalloc|' \
		${WRKSRC}/Makefile

post-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}/scripts
	${INSTALL_PROGRAM} \
		${WRKSRC}/bowtie2*-s \
		${WRKSRC}/bowtie2*-l \
		${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} \
		${WRKSRC}/scripts/*.sh \
		${WRKSRC}/scripts/*.pl \
		${STAGEDIR}${DATADIR}/scripts
	${INSTALL_SCRIPT} ${WRKDIR}/bowtie2-test ${STAGEDIR}${PREFIX}/bin

post-install-DOCS-on:
	(cd ${WRKSRC}/doc && ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR})

post-install-EXAMPLES-on:
	(cd ${WRKSRC}/example && ${COPYTREE_SHARE} . ${STAGEDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
