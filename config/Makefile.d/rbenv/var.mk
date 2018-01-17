RBENV = $(RBENV_DIR)/bin/rbenv
RBENV_DIR = ~/.rbenv
RBENV_PLUGIN_DIR = $(RBENV_DIR)/plugins
RBENV_INSTALLER = https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer

INSTALL_TARGETS += rbenv-install
UPDATE_TARGETS += rbenv-update
