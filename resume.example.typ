#import "theme.typ": *

// ============================================================
// HEADER
// ============================================================
#align(center)[
  #text(size: size-name, weight: "bold", fill: accent)[YOUR NAME]
  #v(4pt)
  #text(size: size-base + 1pt, fill: muted)[Senior Software Engineer]
  #v(4pt)
  #text(size: size-base - 0.5pt)[
    your.email\@example.com · +1 (234) 567-890 · github.com/yourname · City, Country
  ]
]

// ============================================================
// PROFILE
// ============================================================
#section[Profile]
Seasoned software engineer with over 8 years of experience building scalable backend systems and web applications. Passionate about clean architecture, developer tooling, and open-source contributions. Proven track record of leading teams and delivering high-impact projects on time.

// ============================================================
// EXPERIENCE
// ============================================================
#section[Experience]

#entry("Tech Corp Inc.", "Senior Software Engineer", "Jan 2022 – Present")[
  #bullet[Architected and led migration of a monolithic Rails application to microservices, reducing deployment time by 60%.]
  #bullet[Designed and implemented a real-time data processing pipeline handling 500k+ events per second using Kafka and Go.]
  #bullet[Mentored a team of 5 junior engineers, establishing code review standards and engineering best practices.]
]

#entry("StartupXYZ", "Full Stack Developer", "Mar 2019 – Dec 2021")[
  #bullet[Built the core product from ground up using React, Node.js, and PostgreSQL, growing the user base from 0 to 50k.]
  #bullet[Implemented CI/CD pipelines with GitHub Actions, cutting release cycles from weekly to daily deployments.]
  #bullet[Optimized database queries and introduced Redis caching, improving average API response times by 40%.]
]

#entry("Digital Agency Co.", "Backend Developer", "Jun 2016 – Feb 2019")[
  #bullet[Developed RESTful APIs and background job systems for e-commerce clients using Python and Django.]
  #bullet[Automated infrastructure provisioning with Terraform and Ansible, reducing manual setup time by 80%.]
]

// ============================================================
// EDUCATION
// ============================================================
#section[Education]

#entry("University of Technology", "B.Sc. Computer Science", "2012 – 2016")[
  #bullet[GPA: 3.8 / 4.0 | Dean's List 2014–2016]
  #bullet[Thesis: "Optimizing Distributed Consensus Algorithms for Edge Computing Environments"]
]

// ============================================================
// SKILLS
// ============================================================
#section[Skills]

#skill-group("Languages", ("Python", "TypeScript", "Go", "Rust", "SQL"))
#skill-group("Frameworks", ("React", "Node.js", "Django", "FastAPI", "Next.js"))
#skill-group("Infrastructure", ("Docker", "Kubernetes", "AWS", "Terraform", "Kafka"))
#skill-group("Tools", ("Git", "GitHub Actions", "PostgreSQL", "Redis", "Linux"))

// ============================================================
// PROJECTS
// ============================================================
#section[Projects]

#project("OpenSourceLib", "github.com/yourname/opensourcelib")[
  #bullet[A widely-used open-source library for XYZ, with 2k+ GitHub stars and 100+ contributors.]
]

#project("SideProject", "sideproject.dev")[
  #bullet[A SaaS tool that helps developers XYZ, serving 500+ monthly active users with a 4.8/5 rating.]
]
