clear all;
close all;
clc;

m1 = -2;
m2 = 2;
s1 = 0.2;
s2 = 1;
alpha = 0.97;
p1 = 0.3;
p2 = 0.7;
x = -5:0.1:5;

f10 = 1/(sqrt(2*pi)*s1)*exp(-1/2*(x-m1).^2/(s1^2));
f20 = 1/(sqrt(2*pi)*s2)*exp(-1/2*(x-m2).^2/(s2^2));
f0 = p1*f10 + p2*f20;
figure();
plot(x,f0);
title('p(x_0)')
xlabel('x');
%%
figure();
for i=1:200
    f1 = 1/(sqrt(2*pi*(alpha*s1^2 + (1-alpha))))*exp(-1/2*(x-sqrt(alpha)*m1).^2/(alpha*s1^2 + (1-alpha)));
    f2 = 1/(sqrt(2*pi*(alpha*s2^2 + (1-alpha))))*exp(-1/2*(x-sqrt(alpha)*m2).^2/(alpha*s2^2 + (1-alpha)));
    f = p1*f1 + p2*f2;
    m1 = sum(x .* f1) / sum(f1);
    s1 = sqrt(sum(((x - m1).^2) .* f1) / sum(f1));
    m2 = sum(x .* f2) / sum(f2);
    s2 = sqrt(sum(((x - m2).^2) .* f2) / sum(f2));
    if i==1
        subplot(2,4,1);
        plot(x,f);
        title('p(x_t|x_{t-1}), za t=1');
        xlabel('x');
    end
    if i==5
        subplot(2,4,2);
        plot(x,f);
        title('p(x_t|x_{t-1}), za t=5');
        xlabel('x');
    end
    if i==10
        subplot(2,4,3);
        plot(x,f);
        title('p(x_t|x_{t-1}), za t=10');
        xlabel('x');
    end
    if i==30
        subplot(2,4,4);
        plot(x,f);
        title('p(x_t|x_{t-1}), za t=30');
        xlabel('x');
    end
    if i==40
        subplot(2,4,5);
        plot(x,f);
        title('p(x_t|x_{t-1}), za t=40');
        xlabel('x');
    end
    if i==50
        subplot(2,4,6);
        plot(x,f);
        title('p(x_t|x_{t-1}), za t=50');
        xlabel('x');
    end
    if i==100
        subplot(2,4,7);
        plot(x,f);
        title('p(x_t|x_{t-1}), za t=100');
        xlabel('x');
    end
    if i==200
        subplot(2,4,8);
        plot(x,f);
        title('p(x_t|x_{t-1}), za t=200');
        xlabel('x');
    end
    
end
%% 
m1 = -2;
m2 = 2;
s1 = 0.2;
s2 = 1;
alpha = 0.97;
p1 = 0.3;
p2 = 0.7;
alpha = alpha^200;
f1 = 1/(sqrt(2*pi*(alpha*s1^2 + (1-alpha))))*exp(-1/2*(x-sqrt(alpha)*m1).^2/(alpha*s1^2 + (1-alpha)));
f2 = 1/(sqrt(2*pi*(alpha*s2^2 + (1-alpha))))*exp(-1/2*(x-sqrt(alpha)*m2).^2/(alpha*s2^2 + (1-alpha)));

f11 = p1*f1 + p2*f2;
figure();
subplot(3,1,1);
plot(x,f0);
title('p(x_0)')
xlabel('x');

subplot(3,1,2);
plot(x,f);
title('p(x_t|x_{t-1}), za t=200');
xlabel('x');

subplot(3,1,3);
plot(x,f11);
title('p(x_t|x_0), za t=200');
xlabel('x');