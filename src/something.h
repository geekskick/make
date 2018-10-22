#ifndef SOMETHING_H
#define SOMETHING_H

#include <string>
    
class tits{
public:
    tits() = default;
    const std::string& get();
private:
    const std::string m_image{"(. )( .)"};
};
#endif
