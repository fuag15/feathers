# Helper to get parents of Package routes
# these will be either Post Project or Job
module PackagesHelper
  # return the right edit path
  # since we are multi using this model
  def owner_aware_edit_package_path owner, package
    if owner.kind_of? Project
      edit_project_package_path owner, package
    else
      edit_job_package_path owner, package
    end
  end

  # return the right index path
  # since we are sharing this model
  def owner_aware_packages_path owner
    if owner.kind_of? Project
      project_packages_path owner
    else
      job_packages_path owner
    end
  end

  # return the right new path
  # needed since this is a shared model
  def owner_aware_new_package_path owner
    if owner.kind_of? Project
      new_project_package_path owner
    else
      new_job_package_path owner
    end
  end
end
