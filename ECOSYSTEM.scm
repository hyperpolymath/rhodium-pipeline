;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — rhodium-pipeline

(ecosystem
  (version "1.0.0")
  (name "rhodium-pipeline")
  (type "project")
  (purpose "A methodology template for formally-verified data processing pipelines using the Rhodium Standard Repositories (RSR) methodology.")

  (position-in-ecosystem
    "Part of hyperpolymath ecosystem. Follows RSR guidelines.")

  (related-projects
    (project (name "rhodium-standard-repositories")
             (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
             (relationship "standard")))

  (what-this-is "A methodology template for formally-verified data processing pipelines using the Rhodium Standard Repositories (RSR) methodology.")
  (what-this-is-not "- NOT exempt from RSR compliance"))
