#!/bin/bash
clear

echo "Êtes-vous sûr de vouloir installer entièrement Maui Shell ? (y/n)"
read res

if [[ res == "y" || -z $res ]]
then
	echo "Let's continu !"
else
	echo "Non."
	exit
fi

#BUILD DEPENDENCIES
echo "Build Dependencies ? (Y/n)"
read dep

if [[ $dep == "Y" || $dep == "y" || -z $dep ]]
then
sudo pacman -S \
    akonadi-contacts \
    appstream \
    calendarsupport \
    cmake \
    eventviews \
    extra-cmake-modules \
    gcc make \
    git \
    kactivities \
    kactivities-stats \
    kcoreaddons \
    kdesu \
    kdoctools \
    ki18n \
    kidletime \
    kinit \
    kio \
    knotifications \
    knotifyconfig \
    kpeople \
    krunner \
    ktexteditor \
    kunitconversion \
    kwayland \
    libakonadi \
    phonon-qt5 \
    pkgconfig \
    qt5-base \
    qt5-quickcontrols2 \
    qt5-svg \
    qt5-systems	

else
	echo "Installation avoid"
	exit
fi

#Build and Compile Maui Manager
echo "Build and Compile Maui Manager ? (Y/n)"
read bcmn

if [[ $bcmn == "Y" || $bcmn == "y" || -z $bcmn ]]
then
	git clone --depth 1 --branch master https://invent.kde.org/maui/mauiman.git

mkdir -p mauiman/build && cd mauiman/build

cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_BSYMBOLICFUNCTIONS=OFF \
    -DQUICK_COMPILER=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LOCALSTATEDIR=/var \
    -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_FIND_PACKAGE_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_INSTALL_RUNSTATEDIR=/run "-GUnix Makefiles" \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib ../

make -j$(nproc)

sudo make install

else
	echo "Installation avorted."
	exit
fi


#Build and Compile MauiKit
echo "Build and Compile MauiKit ? (Y/n)"
read bcmk

if [[ $bcmk == "Y" || $bcmk == "y" || -z $bcmk ]]
then
	git clone --depth 1 --branch master https://invent.kde.org/maui/mauikit.git

mkdir -p mauikit/build && cd mauikit/build

cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_BSYMBOLICFUNCTIONS=OFF \
    -DQUICK_COMPILER=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LOCALSTATEDIR=/var \
    -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_FIND_PACKAGE_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_INSTALL_RUNSTATEDIR=/run "-GUnix Makefiles" \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_PREFIX_PATH=/usr/lib/cmake/MauiMan ../

make -j$(nproc)

sudo make install

else
	echo "Installation avorted."
	exit
fi

#Build and Compile MauiKit FileBrowsing
echo "Build and Compile MauiKit FileBrowsing ? (Y/n)"
read bcmf

if [[ $bcmf == "Y" || $bcmf == "y" || -z $bcmf ]]
then
	git clone --depth 1 --branch master https://invent.kde.org/maui/mauikit-filebrowsing.git

mkdir -p mauikit-filebrowsing/build && cd mauikit-filebrowsing/build

cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_BSYMBOLICFUNCTIONS=OFF \
    -DQUICK_COMPILER=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LOCALSTATEDIR=/var \
    -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_FIND_PACKAGE_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_INSTALL_RUNSTATEDIR=/run "-GUnix Makefiles" \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_PREFIX_PATH=/usr/lib/cmake/MauiKit ../

make -j$(nproc)

sudo make install

else
	echo "Installation avorted."
	exit
fi


#Build and Compile MauiKit Calendar
echo "Build and Compile MauiKit Calendar ? (Y/n)"
read bcmm

if [[ $bcmm == "Y" || $bcmm == "y" || -z $bcmm ]]
then
	git clone --depth 1 --branch master https://invent.kde.org/maui/mauikit-calendar.git

mkdir -p mauikit-calendar/build && cd mauikit-calendar/build

cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_BSYMBOLICFUNCTIONS=OFF \
    -DQUICK_COMPILER=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LOCALSTATEDIR=/var \
    -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_FIND_PACKAGE_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_INSTALL_RUNSTATEDIR=/run "-GUnix Makefiles" \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_PREFIX_PATH=/usr/lib/cmake/MauiKit ../

make -j$(nproc)

sudo make install

else
	echo "Installation avorted."
	exit
fi

#Build and Compile Maui Core
echo "Build and Compile Maui Core ? (Y/n)"
read bcmc

if [[ $bcmc == "Y" || $bcmc == "y" || -z $bcmc ]]
then
	git clone --depth 1 --branch main https://github.com/Nitrux/maui-core.git

mkdir -p maui-core/build && cd maui-core/build

cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_BSYMBOLICFUNCTIONS=OFF \
    -DQUICK_COMPILER=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LOCALSTATEDIR=/var \
    -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_FIND_PACKAGE_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_INSTALL_RUNSTATEDIR=/run "-GUnix Makefiles" \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_PREFIX_PATH=/usr/lib/cmake/MauiKit ../

make -j$(nproc)

sudo make install

else
	echo "Installation avorted."
	exit
fi

#Build and Compile Cask Server
echo "Build and Compile Cask Server ? (Y/n)"
read bccs

if [[ $bccs == "Y" || $bccs == "y" || -z $bccs ]]
then
	git clone --depth 1 --branch main https://github.com/Nitrux/cask-server.git

mkdir -p cask-server/build && cd cask-server/build

cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_BSYMBOLICFUNCTIONS=OFF \
    -DQUICK_COMPILER=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LOCALSTATEDIR=/var \
    -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_FIND_PACKAGE_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_INSTALL_RUNSTATEDIR=/run "-GUnix Makefiles" \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_PREFIX_PATH=/usr/lib/cmake/MauiKit ../

make -j$(nproc)

sudo make install
else
	echo "Installation avorted."
	exit
fi


#Build and Compile Maui Shell
echo "Build and Compile Maui Shell ? (Y/n)"
read bcms

if [[ $dep == "Y" || $dep == "y" || -z $dep ]]
then
	git clone --depth 1 --branch master https://github.com/Nitrux/maui-shell.git

mkdir -p maui-shell/build && cd maui-shell/build

cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_BSYMBOLICFUNCTIONS=OFF \
    -DQUICK_COMPILER=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LOCALSTATEDIR=/var \
    -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_FIND_PACKAGE_NO_PACKAGE_REGISTRY=ON \
    -DCMAKE_INSTALL_RUNSTATEDIR=/run "-GUnix Makefiles" \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_PREFIX_PATH="/usr/lib/cmake/MauiMan;/usr/lib/cmake/MauiKit;/usr/lib/cmake/MauiKitFileBrowsing;/usr/lib/cmake/MauiKitCalendar;/usr/lib/cmake/MauiCore;/usr/lib/cmake/MauiCoreAudio;/usr/lib/cmake/MauiCoreNotifications;/usr/lib/cmake/MauiCorePower;/usr/lib/cmake/MauiCore;/usr/lib/cmake/CaskServer" ../

make -j$(nproc)

sudo make install
else
	echo "Installation avorted."
	exit
fi

#Maui Shell Runtime Dependencies
echo "Maui Shell Runtime Dependencies ? (Y/n)"
read msrd

if [[ $msrd == "Y" || $msrd == "y" || -z $msrd ]]
then
	sudo pacman -S \
    bluedevil \
    bluez-qt \
    kirigami2 \
    plasma-nm \
    plasma-pa \
    qt5-quickcontrols2
else
	echo "Installation avorted."
	exit
fi

echo "Installation finish."
