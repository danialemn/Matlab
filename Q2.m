% 2.1:
p_0 = 0.3;
p_1 = 1 - p_0 ;
n = 20000; 
numbers = rand(1 , n) < p_1;

histogram(numbers, 'Normalization', 'pdf');
xlabel('بیت'); 
ylabel('احتمال بیت');


% 2.2:
p_0 = 0.3;
p_1 = 1 - p_0;
n = 20000; 
numbers = rand(1, n) < p_1; 

group_first = zeros(1, n / 4);
group_second = zeros(1, n / 4); 

index = 1;
for i = 1:4:n-3
    first_pair = [numbers(i), numbers(i+1)];
    second_pair = [numbers(i+2), numbers(i+3)];

    if isequal(first_pair, [0, 0])
        group_first(index) = -1.5;
    elseif isequal(first_pair, [0, 1])
        group_first(index) = -0.5;
    elseif isequal(first_pair, [1, 0])
        group_first(index) = 0.5;
    elseif isequal(first_pair, [1, 1])
        group_first(index) = 1.5;
    end

    if isequal(second_pair, [0, 0])
        group_second(index) = -1.5;
    elseif isequal(second_pair, [0, 1])
        group_second(index) = -0.5;
    elseif isequal(second_pair, [1, 0])
        group_second(index) = 0.5;
    elseif isequal(second_pair, [1, 1])
        group_second(index) = 1.5;
    end

    index = index + 1;
end

disp('نگاشت مقادیر برای 2 بیت نخست:');
disp(group_first(1:10)); 
disp('نگاشت مقادیر برای 2 بیت انتهایی:');
disp(group_second(1:10));

figure;
subplot(2,1,1);
histogram(group_first, 'Normalization', 'probability');
title('هیستوگرام 2 بیت نخست');
xlabel('مقدار نگاشت');
ylabel('احتمال');

subplot(2,1,2);
histogram(group_second, 'Normalization', 'probability');
title('هیستوگرام 2 بیت انتهایی');
xlabel('مقدار نگاشت');
ylabel('احتمال');




% 2.3:
n = 5000
numbers = rand(1 , n) < p_1;
voltage = [-2, -1, 0, 1, 2];
prob_voltage_a = [0.03, 0.07, 0.8, 0.07, 0.03];
prob_voltage_b = [0.07, 0.03, 0.8, 0.07, 0.03];
noise_a = randsrc(1,n,[voltage; prob_voltage_a]);
noise_b = randsrc(1,n,[voltage; prob_voltage_b]);


figure;
histogram(noise_a, 'Normalization', 'probability');
xlabel('ولتاژ');
ylabel('احتمال');

figure;
histogram(noise_b, 'Normalization', 'probability');
xlabel('ولتاژ');
ylabel('احتمال');


% 2.4:
finall_a = noise_a + group_first;
finall_b = noise_b + group_second;


n = length(finall_a);

mapped_bits_a = ""; 

for i = 1:n
    if finall_a(i) <= -1
        mapped_bits_a = strcat(mapped_bits_a, "00");
    elseif finall_a(i) > -1 && finall_a(i) <= 0
        mapped_bits_a = strcat(mapped_bits_a, "01"); 
    elseif finall_a(i) > 0 && finall_a(i) <= 1
        mapped_bits_a = strcat(mapped_bits_a, "10"); 
    elseif finall_a(i) > 1
        mapped_bits_a = strcat(mapped_bits_a, "11"); 
    end
end

bit_sequence = char(mapped_bits_a);
% disp(['طول دنباله بیت نهایی: ', num2str(length(bit_sequence))]);


mapped_bits_b = "";
for i = 1:n
    if finall_b(i) <= -1
        mapped_bits_b = strcat(mapped_bits_b, "00");
    elseif finall_b(i) > -1 && finall_b(i) <= 0
        mapped_bits_b = strcat(mapped_bits_b, "01"); 
    elseif finall_b(i) > 0 && finall_b(i) <= 1
        mapped_bits_b = strcat(mapped_bits_b, "10"); 
    elseif finall_b(i) > 1
        mapped_bits_b = strcat(mapped_bits_b, "11"); 
    end
end
bit_sequence_2 = char(mapped_bits_b);
disp(['طول دنباله بیت نهایی: ', num2str(length(bit_sequence_2))]);




if length(mapped_bits_a) ~= length(mapped_bits_b)
    error('طول رشته‌های a و b باید برابر باشد.');
end

n = length(mapped_bits_a);
result = ""; 

for i = 1:2:length(bit_sequence)-1
    part_a = bit_sequence(i:i+1);

    part_b = bit_sequence_2(i:i+1);

    result = result + part_a + part_b;
end
