#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include <QtWidgets>
#include <QMainWindow>
QT_BEGIN_NAMESPACE
 class QLabel;
 class QPushButton;
 class QPainter;
 class QLineEdit;
 class QColor;
QT_END_NAMESPACE
class MainWindow :public QMainWindow
{
	Q_OBJECT
	public:
    	MainWindow();
    protected:
    	void paintEvent (QPaintEvent *event);
    private slots:
    	void startButtonClick();
        void rgbButtonClick();
        void mRedButtonClick();
        void pRedButtonClick();
        void mGreenButtonClick();
        void pGreenButtonClick();
        void mBlueButtonClick();
        void pBlueButtonClick();
        void mWhiteButtonClick();
        void pWhiteButtonClick();
    private:
        QLabel *redLabel;
        QLabel *greenLabel;
        QLabel *blueLabel;
        QLabel *whiteLabel;
        QLabel *rLabel;
        QLabel *gLabel;
    	    QLabel *bLabel;
        QPainter *p;
        QPushButton *startButton;
        QPushButton *rgbButton;
        QLineEdit *redEdit;
        QLineEdit *greenEdit;
        QLineEdit *blueEdit;
        QLineEdit *whiteEdit;	
        QLineEdit *rEdit;
        QLineEdit *gEdit;
        QLineEdit *bEdit;
        QColor color;
        int redColor;
        int greenColor;
        int blueColor;
        int whiteColor;
        int rColor;
        int gColor;
        int bColor;
        QPushButton *mRedButton, *pRedButton;
        QPushButton *mGreenButton, *pGreenButton;
        QPushButton *mBlueButton, *pBlueButton;
        QPushButton *mWhiteButton, *pWhiteButton;
};
#endif
