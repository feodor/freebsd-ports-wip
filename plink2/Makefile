# $FreeBSD$

PORTNAME=		plink2
DISTVERSIONPREFIX=	v
DISTVERSION=		g20190227
CATEGORIES=		wip biology

MAINTAINER=	jwb@FreeBSD.org
COMMENT=	Whole genome association analysis toolset

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/LICENSE

# Seg faults with openblas
# #0  0x0000000800eb66ef in dgemm_otcopy_CORE2 ()
#   from /usr/local/lib/libopenblas.so.0
#		libopenblas.so:math/openblas
LIB_DEPENDS=	libcblas.so:math/cblas \
		liblapack.so:math/lapack \
		libblas.so:math/blas

# We need Fortran LDFLAGS to link with Lapack.
USES=		fortran gmake python:2.7 shebangfix
USE_GITHUB=	yes

SHEBANG_FILES=	Tests/*.sh Tests/*/*.sh
GH_ACCOUNT=	chrchang
GH_PROJECT=	plink-ng
GH_TAGNAME=	189224a

MAKEFILE=	${FILESDIR}/Makefile.generic
WRKSRC_SUBDIR=	2.0
CFLAGS+=	-DDYNAMIC_ZLIB
LDFLAGS+=	-lpthread
MAKE_ARGS=	ZLIB=-lz BLASFLAGS="-L${LOCALBASE}/lib -llapack -lcblas -lblas -lgfortran"

INSTALL_TARGET=	install-strip

SUB_FILES=	plink2-test

post-patch:
	@${REINPLACE_CMD} -e 's|../../build_dynamic|${PREFIX}/bin|g' \
		${WRKSRC}/Tests/run_tests.sh
	@${REINPLACE_CMD} -e 's|^python|${PYTHON_CMD}|g' \
		${WRKSRC}/Tests/TEST_PHASED_VCF/run_tests.sh
	@${CHMOD} a+rx \
		${WRKSRC}/Tests/run_tests.sh \
		${WRKSRC}/Tests/*/run_tests.sh

post-install:
	@(cd ${WRKSRC}/Tests && ${CHMOD} a+X run_tests.sh */run_tests.sh)
	(cd ${WRKSRC} && ${COPYTREE_BIN} Tests ${STAGEDIR}${DATADIR})
	${INSTALL_SCRIPT} ${WRKDIR}/plink2-test ${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${FILESDIR}/plink2-bench ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
