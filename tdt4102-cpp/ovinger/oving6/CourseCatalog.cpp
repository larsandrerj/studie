#include "CourseCatalog.h"

// BEGIN: 3a
void CourseCatalog::addCourse(const string& key, const string& value)
{
    courses.insert(key, value);
}
// END: 3a

// BEGIN: 3b
void CourseCatalog::removeCourse(const string& key)
{
    courses.erase(key);
}
// END: 4b

// BEGIN: 3c

string CourseCatalog::getCourse(const string& key) const
{
    return courses.at(key);
}
// END: 3c

// BEGIN: 3d

std::ostream& operator<<(ostream& os, const CourseCatalog& cc)
{
    for (std::pair<const std::string, const std::string> course : cc.courses)
    {
        os << course.first << ":" + course.second << std::endl;
    }
}

// END: 3d

// BEGIN: 3e
void testCourseCatalog()
{
    CourseCatalog cc;

    cc.addCourse("TDT4110", "ITGK");
    cc.addCourse("TDT4102", "C++");
    cc.addCourse("TMA4100", "Matte :)");

    std::cout << cc.getCourse("TDT4110") << std::endl;
    std::cout << cc.getCourse("TDT4102") << std::endl;
    std::cout << cc.getCourse("TMA4100") << std::endl;
}

// END: 3e

// BEGIN: 3g


void CourseCatalog::saveToFile(const std::string& filename) const
{
    std::ofstream output_stream{filename};
    output_stream << *this;
}

// END: 3g

// BEGIN: 3h

void CourseCatalog::loadFromFile(const std::string& filename)
{
    std::ifstream input_stream{filename};
    std::string s;
    std::vector<string> s_stream;

    while (std::getline(input_stream, s, ':')) s_stream.push_back(s);

    for (int i = 0; i < s_stream.size(); i+=2) this->addCourse(s_stream.at(i), s_stream.at(i + 1));


}

// END: 3h