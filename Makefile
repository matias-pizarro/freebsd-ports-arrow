# $FreeBSD$

PORTNAME=	arrow
DISTVERSION=	1.0.1
CATEGORIES=	databases
MASTER_SITES=	https://mirrors.advancedhosters.com/apache/${PORTNAME}/${PORTNAME}-${DISTVERSION}/
DISTNAME=	apache-${PORTNAME}-${DISTVERSION}

MAINTAINER=	yuri@FreeBSD.org
COMMENT=	Columnar in-memory analytics layer for big data

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/../LICENSE.txt

LIB_DEPENDS=	libboost_system.so:devel/boost-libs

USES=		cmake compiler:c++11-lang pkgconfig
USE_LDCONFIG=	yes

WRKSRC_SUBDIR=	cpp

CMAKE_OFF=	ARROW_BUILD_STATIC

OPTIONS_GROUP=		COMPRESSION
OPTIONS_GROUP_COMPRESSION=	BROTLI BZ2 LZ4 SNAPPY ZLIB ZSTD
OPTIONS_DEFAULT=	BROTLI BZ2 LZ4 SNAPPY ZLIB ZSTD

COMPRESSION_DESC=	Compression support:

BROTLI_CMAKE_BOOL=	ARROW_WITH_BROTLI
BROTLI_LIB_DEPENDS=	libbrotlicommon.so:archivers/brotli

BZ2_DESC=		bz2 compression support
BZ2_CMAKE_BOOL=		ARROW_WITH_BZ2

LZ4_CMAKE_BOOL=		ARROW_WITH_LZ4
LZ4_LIB_DEPENDS=	liblz4.so:archivers/liblz4

SNAPPY_CMAKE_BOOL=	ARROW_WITH_SNAPPY
SNAPPY_LIB_DEPENDS=	libsnappy.so:archivers/snappy

ZLIB_CMAKE_BOOL=	ARROW_WITH_ZLIB

ZSTD_DESC=		zstd compression support
ZSTD_CMAKE_BOOL=	ARROW_WITH_ZSTD
ZSTD_LIB_DEPENDS=	libzstd.so:archivers/zstd

.include <bsd.port.mk>
