# core files like application.js
def core_root
  File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'resources', 'core'))
end

def destination_root
  File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'tmp'))
end

def fixtures_root
  File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'fixtures'))
end

def load_core
  FileUtils.cp_r(core_root, destination_root)
end

def load_fixtures
  FileUtils.cp_r(fixtures_root, destination_root)
end

def reload_core
  cleanup_tmp_dir
  load_core
end

def cleanup_tmp_dir
  FileUtils.rm_rf(destination_root)
end