module PermissionsConcern
    extend ActiveSupport::Concern

    def is_normal_user?
        self.permission_level >= 1
    end

    def is_comerciante?
        self.permission_level >= 2
    end

    def is_jefe_col?
        self.permission_level >= 3
    end

    def is_aprendiz_u?
        self.permission_level >= 4
    end
    
    def is_profesor_u?
        self.permission_level >= 5
    end

    def is_admin?
        self.permission_level >= 6
    end
    
end