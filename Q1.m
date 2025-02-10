% 1.1:
a = 3;
b = (2*a)+1;
start_from = 0;
end_to = 10000;
step = 5;
requested_var = [];
requested_mean = [];
for count = start_from:step:end_to
random_num = randi([a,b], 1, count);
var_in_each_loop = var(random_num);
mean_in_each_loop = mean(random_num);
requested_mean = [requested_mean mean_in_each_loop];
requested_var = [requested_var var_in_each_loop];
end
figure;

plot(start_from:step:end_to , requested_var);
xlabel('تعداد');
ylabel('واریانس اعداد');


plot(start_from:step:end_to , requested_mean);
xlabel('تعداد');
ylabel('میانگین اعداد');



% 1.2:
a = 3;
b = (2*a)+1;
start_from = 0;
end_to = 10000;
step = 5;
requested_var = [];
requested_mean = [];
for count = start_from:step:end_to
random_num = randi([a,b], 1, count);
var_in_each_loop = var(random_num);
mean_in_each_loop = mean(random_num);
requested_mean = [requested_mean mean_in_each_loop];
requested_var = [requested_var var_in_each_loop];
Zn = ((mean_in_each_loop - a) / sqrt(var_in_each_loop)) * sqrt(count);
end


% 1.2.2:
a = 3;
b = (2*a)+1;
n = 1000;
Zn_new = zeros(1,n);
for x = 1:n
random_num = randi([a,b], 1, n);
mean_in_each_loop = mean(random_num);
var_in_each_loop = var(random_num);
Zn_new(x) = ((mean_in_each_loop - a) / sqrt(var_in_each_loop)) * sqrt(n);
end
figure;
histogram(Zn_new, 50, 'Normalization', 'pdf');
xlabel('Zn_new');
ylabel('احتمال برای 1000 تا');


% 1.3:
a = 1+1;
n = 1000;
count = 1000;
param = 1 / (mod(a, 10) + 1);
exp = exprnd(1/param, n, count);

Sum_exp = sum(exp);
var_exp = var(exp(:));
mean_exp = mean(exp(:));

Zn_exp = (Sum_exp - n * mean_exp) ./ sqrt(n * var_exp);

figure;
histogram(Zn_exp, 50, 'Normalization', 'pdf');
xlabel('Zn');
ylabel('مقدار');

mean_zn = mean(Zn_exp);
disp(['mean Zn: ', num2str(mean_zn)]);

var_zn = var(Zn_exp);
disp(['var Zn: ', num2str(var_zn)]);



% 1.4
param = 1/3;
n = 1000;
count = 1000;
zn_bernoulli = zeros(1, count);
for x = 1:count
    random_num = binornd(1, param, [1, n]);
    mean_in_each_loop = mean(random_num);
    var_in_each_loop = var(random_num);
    zn_bernoulli(x) = ((mean_in_each_loop - param) / sqrt(var_in_each_loop)) * sqrt(n);
end

figure;
histogram(zn_bernoulli, 50, 'Normalization', 'pdf');
xlabel('zn');
ylabel('چگالی احتمال');
