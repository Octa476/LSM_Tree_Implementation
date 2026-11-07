#ifndef _LSM_H_
#define _LSM_H_

#include <string>
#include <optional>

struct LsmConfig {

};

class LsmTree {
    private:
        LsmConfig m_config;

    public:
        LsmTree(LsmConfig &config);

        LsmTree();

        bool put(std::string &key, std::string &value);

        std::optional<std::string> get(std::string &key);

        bool del(std::string &key);
};

#endif _LSM_H_