#include "cannonball.h"
#include "cannonball_viz.h"
#include "utilities.h"

// BEGIN: 2a
// Implementer funksjonen acclY

double acclY()
{
    return -gravity;
}
// END: 2a

// BEGIN: 2b
// Implementer funksjonen velY
double velY(double initVelocityY, double time)
{
    return initVelocityY + acclY() * time;
}
// END: 2b

// BEGIN: 2c
// Implementer funksjonene posX og posY
double posX(double initPositionX, double initVelocityX, double time)
{
    return initPositionX + initVelocityX * time;
}

double posY(double initPositionY, double initVelocityY, double time)
{
    return initPositionY + initVelocityY * time + (acclY() * pow(time, 2)) / 2;
}
// END: 2c

// BEGIN: 2d
// Implementer funksjonen printTime
void printTime(double time)
{
    std::cout << "time: " << time << std::endl;
}
// END: 2d

// BEGIN: 2e
// Implementer funksjonen flightTime
double flightTime(double initVelocityY)
{
    return (-2 * initVelocityY) / acclY();
}
// END: 2e

// BEGIN: 3b
// Implementer funksjonen testDeviation
bool testDeviation(double compareOperand, double toOperand, double maxError, string name)
{
    double res = abs(compareOperand - toOperand);
    std::cout << name << ": " << res << std::endl;

    if (res <= maxError) return true;
    
    return false;
}
// END: 3b

// BEGIN: 4a
// Her skal du implementere ALLE funksjonene i oppgave 4a
double getUserInputTheta()
{
    double theta;
    std::cin >> theta;
    return theta;
}


double getUserInputInitVelocity()
{
    double initVelocity;
    std::cin >> initVelocity;
    return initVelocity;
}


double degToRad(double deg)
{
    return (deg * pi) / 180;
}

double getVelocityX(double theta, double initVelocity)
{
    return initVelocity * cos(degToRad(theta));
}

double getVelocityY(double theta, double initVelocity)
{
    return initVelocity * sin(degToRad(theta));
}

std::vector<double> getVelocityVector(double theta, double initVelocity)
{
    return std::vector<double>{getVelocityX(theta, initVelocity), getVelocityY(theta, initVelocity)};
}
// END: 4a

// BEGIN: 4b
double getDistanceTraveled(double velocityX, double velocityY)
{
    return posX(0.0, velocityX, flightTime(velocityY));
}

// END: 4b

// BEGIN: 4c

double targetPractice(double distanceToTarget, double velocityX, double velocityY)
{
    return distanceToTarget - getDistanceTraveled(velocityX, velocityY);
}
// END: 4c


// BEGIN: 5b
void playTargetPractice()
{
    int posTarget = randomWithLimits(100, 1000);

    for (int i = 0; i < 10; i++)
    {
        std::cout << "oppgi vinkel (deg): " << std::endl;
        double theta = getUserInputTheta();

        std::cout << "oppgi startfart: " << std::endl;
        double velocity = getUserInputInitVelocity();

        std::vector<double> velocityVector = getVelocityVector(theta, velocity);

        double res = targetPractice(posTarget, velocityVector.at(0), velocityVector.at(1));

        string text = (res > 0) ? "for langt" : "for kort";

        std::cout << "result: " << res << ", " << text << std::endl;

        if (abs(res) <= 5)
        {
            std::cout << "Du vant, gratulerer" << std::endl;
            return;
        }
    }

    std::cout << "Ingen flere forsøk, du tapte. GG" << std::endl;

    return;
}
// END: 5b
