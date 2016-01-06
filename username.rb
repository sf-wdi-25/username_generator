# Make sure to run the tests in your /spec folder
# Run `rspec /spec/username_spec.rb` to get started.


def format_name(first, last)
	return nil if first.empty? || last.empty?
  (first.gsub(/[\W0-9_]/, "")[0] + last.gsub(/[\W0-9_]/, "")).downcase
end

def format_year(year)
	return nil if year.to_s.length != 4
  year.to_s[-2..-1]
end

def build_username(first_name, last_name, birth_year, privilege_level=0)
  user_type_prefix(privilege_level) + format_name(first_name, last_name) +
  format_year(birth_year)
end

def check_privilege(level=0)
	if level > 3
		level = 3
	end
	user_type = ["user", "seller", "manager", "admin"]
	user_type[level]
end

def user_type_prefix(level)
	return "" if level == 0
	check_privilege(level) + "-"
end

$user_counts = {}

def generate_username(first_name, last_name, birth_year, privilege_level=0)
	username = build_username(first_name, last_name, birth_year, privilege_level)
	if $user_counts.has_key?(username)
		user_count = $user_counts[username]
		new_username = "#{username}_#{user_count.to_s}"
		$user_counts[username] += 1
		new_username
	else
		$user_counts[username] = 1
		username
	end
end