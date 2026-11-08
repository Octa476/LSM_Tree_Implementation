#ifndef _MEMTABLE_HPP_
#define _MEMTABLE_HPP_

#include <unordered_map>
#include <string>

class Memtable {
    private:
        std::unordered_map<std::string, std::string> _mp;

    public:
};

#endif