# $FreeBSD$

PORTNAME=	ad2vcf
DISTVERSION=	g20190107
CATEGORIES=	wip biology

MAINTAINER=	jwb@FreeBSD.org
COMMENT=	Add allelic depth info from a SAM stream to a VCF file

LICENSE=	BSD2CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${LOCALBASE}/lib/libvcfio.a:wip/vcfio

USE_GITHUB=	yes
GH_ACCOUNT=	auerlab
GH_TAGNAME=	6e307e39

PLIST_FILES=	bin/ad2vcf

pre-build:
	(cd ${WRKSRC} && ${MAKE} LOCALBASE=${LOCALBASE} depend)

.include <bsd.port.mk>
