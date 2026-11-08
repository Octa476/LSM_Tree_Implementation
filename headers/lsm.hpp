#ifndef _LSM_HPP_
#define _LSM_HPP_

#include <string>
#include <optional>

struct LsmConfig {
    size_t file_layer_count;
    size_t memtable_max_count;
    std::string lsm_parent_folder;
};

class LsmTree {
    private:
        LsmConfig m_config;

    public:
        LsmTree(LsmConfig &config);

        LsmTree();

        LsmTree(const LsmTree &obj);

        LsmTree(LsmTree &&obj);

        LsmTree &operator=(const LsmTree &obj);

        LsmTree &operator=(LsmTree &&obj);
        
        ~LsmTree();

        bool put(std::string &key, std::string &value);

        std::optional<std::string> get(std::string &key);

        bool del(std::string &key);
        
};

#endif