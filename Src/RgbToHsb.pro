TEMPLATE = app
TARGET = RgbToHsb
INCLUDEPATH += .
QT += widgets
# Input
HEADERS += mainwindow.h
SOURCES += main.cpp\
 mainwindow.cpp
Файл mainwindow.cpp
#include <QtWidgets>
#include <QtGui>
#include <QColor>
#include "mainwindow.h"
QString strRedColor;
QString strGreenColor;
QString strBlueColor;
QString strWhiteColor;
QString strRgbColor;
QString strRrgbColor;
QString strGrgbColor;
QString strBrgbColor;
MainWindow::MainWindow() {
	setWindowTitle(tr("RGB to HSB"));
	setFixedSize(900,500);
strRgbColor="";
	redColor = 360;
	greenColor = 255;
	blueColor = 255;
	whiteColor = 255;
	rColor=255;
	gColor=0;
	bColor=0;
    strRedColor.setNum(redColor);
    strGreenColor.setNum(greenColor);
    strBlueColor.setNum(blueColor);
    strWhiteColor.setNum(whiteColor);
    strRrgbColor.setNum(rColor);
    strGrgbColor.setNum(gColor);
    strBrgbColor.setNum(bColor);
	redLabel = new QLabel(this);
	redLabel->setGeometry(10, 10, 880, 50);
	redLabel->setFont(QFont("Courier", 20, QFont::Bold));
	redLabel->setText( "H(оттенок): " + QString::number(redColor) );
	greenLabel = new QLabel(this);
	greenLabel->setGeometry(10, 30, 880, 50);
	greenLabel->setFont(QFont("Courier", 20, QFont::Bold));
	greenLabel->setText( "S(насыщенность): " + QString::number(greenColor) );
	blueLabel = new QLabel(this);
	blueLabel->setGeometry(10, 50, 880, 50);
	blueLabel->setFont(QFont("Courier", 20, QFont::Bold));
	blueLabel->setText( "V(яркость): " + QString::number(blueColor) );
    whiteLabel = new QLabel(this);
	whiteLabel->setGeometry(10, 70, 880, 50);
	whiteLabel->setFont(QFont("Courier", 20, QFont::Bold));
	whiteLabel->setText( "A(прозрачность): " + QString::number(whiteColor) );
    rLabel = new QLabel(this);
    rLabel->setGeometry(600, 10, 880, 50);
    rLabel->setFont(QFont("Courier", 20, QFont::Bold));
    rLabel->setText( "R: " + QString::number(rColor) );
    gLabel = new QLabel(this);
    gLabel->setGeometry(600, 30, 880, 50);
    gLabel->setFont(QFont("Courier", 20, QFont::Bold));
    gLabel->setText( "G: " + QString::number(gColor) );
    bLabel = new QLabel(this);
    bLabel->setGeometry(600, 50, 880, 50);
    bLabel->setFont(QFont("Courier", 20, QFont::Bold));
    bLabel->setText( "B: " + QString::number(bColor) );
	startButton = new QPushButton(tr("HSV"), this);
	startButton->setGeometry(10, 310, 100, 30);
	connect(startButton, SIGNAL(clicked()), this, SLOT(startButtonClick()));
    rgbButton = new QPushButton(tr("RGB"), this);
	rgbButton->setGeometry(10, 350, 100, 30);
	connect(rgbButton, SIGNAL(clicked()), this, SLOT(rgbButtonClick()));	
	redEdit = new QLineEdit(this);
	redEdit->setGeometry(40, 120, 150, 30);
	redEdit->setText(QString::number(redColor));
	greenEdit = new QLineEdit(this);
	greenEdit->setGeometry(40, 150, 150, 30);
	greenEdit->setText(QString::number(greenColor));
	blueEdit = new QLineEdit(this);
	blueEdit->setGeometry(40, 180, 150, 30);
	blueEdit->setText(QString::number(blueColor));
	whiteEdit = new QLineEdit(this);
	whiteEdit->setGeometry(40, 210, 150, 30);
	whiteEdit->setText(QString::number(whiteColor));
    rEdit = new QLineEdit(this);
    rEdit->setGeometry(600, 120, 150, 30);
    rEdit->setText(QString::number(rColor));
    gEdit = new QLineEdit(this);
    gEdit->setGeometry(600, 150, 150, 30);
    gEdit->setText(QString::number(gColor));
    bEdit = new QLineEdit(this);
	bEdit->setGeometry(600, 180, 150, 30);
    bEdit->setText(QString::number(bColor));
	mRedButton = new QPushButton(tr("-"), this);
	mRedButton->setGeometry(10, 120, 30, 30);
	connect(mRedButton, SIGNAL(clicked()), this, SLOT(mRedButtonClick()));
	pRedButton = new QPushButton(tr("+"), this);
	pRedButton->setGeometry(190, 120, 30, 30);
	connect(pRedButton, SIGNAL(clicked()), this, SLOT(pRedButtonClick()));
	mGreenButton = new QPushButton(tr("-"), this);
	mGreenButton->setGeometry(10, 150, 30, 30);
	connect(mGreenButton, SIGNAL(clicked()), this, SLOT(mGreenButtonClick()));
	pGreenButton = new QPushButton(tr("+"), this);
	pGreenButton->setGeometry(190, 150, 30, 30);
	connect(pGreenButton, SIGNAL(clicked()), this, SLOT(pGreenButtonClick()));
	mBlueButton = new QPushButton(tr("-"), this);
	mBlueButton->setGeometry(10, 180, 30, 30);
	connect(mBlueButton, SIGNAL(clicked()), this, SLOT(mBlueButtonClick()));
	pBlueButton = new QPushButton(tr("+"), this);
	pBlueButton->setGeometry(190, 180, 30, 30);
	connect(pBlueButton, SIGNAL(clicked()), this, SLOT(pBlueButtonClick()));
	mWhiteButton = new QPushButton(tr("-"), this);
	mWhiteButton->setGeometry(10, 210, 30, 30);
	connect(mWhiteButton, SIGNAL(clicked()), this, SLOT(mWhiteButtonClick()));
	pWhiteButton = new QPushButton(tr("+"), this);
	pWhiteButton->setGeometry(190, 210, 30, 30);
	connect(pWhiteButton, SIGNAL(clicked()), this, SLOT(pWhiteButtonClick()));
	color.setHsv(redColor, greenColor, blueColor, whiteColor);
    color.getRgb(&rColor,&gColor,&bColor);
}
void MainWindow::rgbButtonClick() {
rColor = rEdit->text().toInt();
gColor = gEdit->text().toInt();
bColor = bEdit->text().toInt();
whiteColor = whiteEdit->text().toInt();
color.setRgb(rColor, gColor, bColor,whiteColor);
rLabel->setText( "R: " + QString::number(rColor) );
gLabel->setText( "G: " + QString::number(gColor) );
bLabel->setText( "B: " + QString::number(bColor) );
redColor = redEdit->text().toInt();
greenColor = greenEdit->text().toInt();
blueColor = blueEdit->text().toInt();
whiteColor = whiteEdit->text().toInt();
color.getHsv(&redColor,&greenColor,&blueColor,&whiteColor);
redLabel->setText( "H(оттенок): " + QString::number(redColor) );
greenLabel->setText("S(насыщенность): " + QString::number(greenColor) );
blueLabel->setText( "V(яркость): " + QString::number(blueColor) );
whiteLabel->setText("A(прозрачность): "+ QString::number(whiteColor) );
redEdit->setText(QString::number(redColor));
greenEdit->setText(QString::number(greenColor));
blueEdit->setText(QString::number(blueColor));
update();
}
void MainWindow::startButtonClick() {
	redColor = redEdit->text().toInt();
	greenColor = greenEdit->text().toInt();
	blueColor = blueEdit->text().toInt();
	whiteColor = whiteEdit->text().toInt();
	color.setHsv(redColor, greenColor, blueColor, whiteColor);
	redLabel->setText( "H(оттенок): " + QString::number(redColor) );
	greenLabel->setText("S(насыщенность): " + QString::number(greenColor) );
	blueLabel->setText( "V(яркость): " + QString::number(blueColor) );
    whiteLabel->setText("A(прозрачность): "+ QString::number(whiteColor) );
rColor = rEdit->text().toInt();
gColor = gEdit->text().toInt();
bColor = bEdit->text().toInt();
color.getRgb(&rColor,&gColor,&bColor);
rLabel->setText( "R: " + QString::number(rColor) );
gLabel->setText( "G: " + QString::number(gColor) );
bLabel->setText( "B: " + QString::number(bColor) );
rEdit->setText(QString::number(rColor));
gEdit->setText(QString::number(gColor));
bEdit->setText(QString::number(bColor));
update();
}
void MainWindow::paintEvent( QPaintEvent * ) {
	QPainter p(this);
	p.setBrush(QBrush(color));
	p.drawRect(350,50,200,200);
}
void MainWindow::mRedButtonClick() {
	redColor = redEdit->text().toInt();
	redColor--;
	if(redColor < 0 || redColor > 360)
		redColor = 0;
	redEdit->setText(QString::number(redColor));
	startButtonClick();
}
void MainWindow::pRedButtonClick() {
	redColor = redEdit->text().toInt();
	redColor++;
	if(redColor < 0 || redColor > 360)
		redColor = 0;
	redEdit->setText(QString::number(redColor));
	startButtonClick();
	
}
void MainWindow::mGreenButtonClick() {
	greenColor = greenEdit->text().toInt();
	greenColor--;
	if(greenColor < 0 || greenColor > 255)
		greenColor = 0;
	greenEdit->setText(QString::number(greenColor));
	startButtonClick();
	
}
void MainWindow::pGreenButtonClick() {
	greenColor = greenEdit->text().toInt();
	greenColor++;
	if(greenColor < 0 || greenColor > 255)
		greenColor = 0;
	greenEdit->setText(QString::number(greenColor));
	startButtonClick();
}
void MainWindow::mBlueButtonClick() {
	blueColor = blueEdit->text().toInt();
	blueColor--;
	if(blueColor < 0 || blueColor > 255)
		blueColor = 0;
	blueEdit->setText(QString::number(blueColor));
	startButtonClick();
	
}
void MainWindow::pBlueButtonClick() {
	blueColor = blueEdit->text().toInt();
	blueColor++;
	if(blueColor < 0 || blueColor > 255)
		blueColor = 0;
	blueEdit->setText(QString::number(blueColor));
	startButtonClick();
	
}
void MainWindow::mWhiteButtonClick() {
	whiteColor = whiteEdit->text().toInt();
	whiteColor--;
	if(whiteColor < 0 || whiteColor > 255)
		whiteColor = 0;
	whiteEdit->setText(QString::number(whiteColor));
	startButtonClick();
	
}
void MainWindow::pWhiteButtonClick() {
	whiteColor = whiteEdit->text().toInt();
	whiteColor++;
	if(whiteColor < 0 || whiteColor > 255)
		whiteColor = 0;
	whiteEdit->setText(QString::number(whiteColor));
	startButtonClick();
}
